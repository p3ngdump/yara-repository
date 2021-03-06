rule win_stration_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.stration."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.stration"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 57 8d54240c 52 33f6 56 8d442418 50 }
            // n = 7, score = 100
            //   57                   | push                edi
            //   8d54240c             | lea                 edx, [esp + 0xc]
            //   52                   | push                edx
            //   33f6                 | xor                 esi, esi
            //   56                   | push                esi
            //   8d442418             | lea                 eax, [esp + 0x18]
            //   50                   | push                eax

        $sequence_1 = { 8bd1 52 e8???????? 8a0d???????? 80f10e a3???????? }
            // n = 6, score = 100
            //   8bd1                 | mov                 edx, ecx
            //   52                   | push                edx
            //   e8????????           |                     
            //   8a0d????????         |                     
            //   80f10e               | xor                 cl, 0xe
            //   a3????????           |                     

        $sequence_2 = { 8bd1 52 e8???????? 8a0d???????? 83c404 80c13f a3???????? }
            // n = 7, score = 100
            //   8bd1                 | mov                 edx, ecx
            //   52                   | push                edx
            //   e8????????           |                     
            //   8a0d????????         |                     
            //   83c404               | add                 esp, 4
            //   80c13f               | add                 cl, 0x3f
            //   a3????????           |                     

        $sequence_3 = { 83ec0c 85c0 56 660fbe35???????? 0f859f000000 a1???????? 668b0d???????? }
            // n = 7, score = 100
            //   83ec0c               | sub                 esp, 0xc
            //   85c0                 | test                eax, eax
            //   56                   | push                esi
            //   660fbe35????????     |                     
            //   0f859f000000         | jne                 0xa5
            //   a1????????           |                     
            //   668b0d????????       |                     

        $sequence_4 = { 8b542410 c1ea08 32d0 88542411 8b4c2410 c1e910 }
            // n = 6, score = 100
            //   8b542410             | mov                 edx, dword ptr [esp + 0x10]
            //   c1ea08               | shr                 edx, 8
            //   32d0                 | xor                 dl, al
            //   88542411             | mov                 byte ptr [esp + 0x11], dl
            //   8b4c2410             | mov                 ecx, dword ptr [esp + 0x10]
            //   c1e910               | shr                 ecx, 0x10

        $sequence_5 = { 52 e8???????? a3???????? 8b4c2420 }
            // n = 4, score = 100
            //   52                   | push                edx
            //   e8????????           |                     
            //   a3????????           |                     
            //   8b4c2420             | mov                 ecx, dword ptr [esp + 0x20]

        $sequence_6 = { 32d0 a1???????? 884c2418 8b0d???????? }
            // n = 4, score = 100
            //   32d0                 | xor                 dl, al
            //   a1????????           |                     
            //   884c2418             | mov                 byte ptr [esp + 0x18], cl
            //   8b0d????????         |                     

        $sequence_7 = { 83ec14 85c0 756f a1???????? 8b0d???????? }
            // n = 5, score = 100
            //   83ec14               | sub                 esp, 0x14
            //   85c0                 | test                eax, eax
            //   756f                 | jne                 0x71
            //   a1????????           |                     
            //   8b0d????????         |                     

        $sequence_8 = { 66c1e808 32c8 884c2428 88542432 }
            // n = 4, score = 100
            //   66c1e808             | shr                 ax, 8
            //   32c8                 | xor                 cl, al
            //   884c2428             | mov                 byte ptr [esp + 0x28], cl
            //   88542432             | mov                 byte ptr [esp + 0x32], dl

        $sequence_9 = { 83c404 a3???????? 8b4c242c 8b542428 }
            // n = 4, score = 100
            //   83c404               | add                 esp, 4
            //   a3????????           |                     
            //   8b4c242c             | mov                 ecx, dword ptr [esp + 0x2c]
            //   8b542428             | mov                 edx, dword ptr [esp + 0x28]

    condition:
        7 of them and filesize < 49152
}