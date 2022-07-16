rule win_punkey_pos_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.punkey_pos."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.punkey_pos"
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
        $sequence_0 = { f7c600000040 741d a1???????? 85c0 740e 56 57 }
            // n = 7, score = 200
            //   f7c600000040         | test                esi, 0x40000000
            //   741d                 | je                  0x1f
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_1 = { 6a02 a3???????? ff15???????? a3???????? 33c0 }
            // n = 5, score = 200
            //   6a02                 | push                2
            //   a3????????           |                     
            //   ff15????????         |                     
            //   a3????????           |                     
            //   33c0                 | xor                 eax, eax

        $sequence_2 = { 8bec 837d0c01 56 57 756b 8b4508 }
            // n = 6, score = 200
            //   8bec                 | mov                 ebp, esp
            //   837d0c01             | cmp                 dword ptr [ebp + 0xc], 1
            //   56                   | push                esi
            //   57                   | push                edi
            //   756b                 | jne                 0x6d
            //   8b4508               | mov                 eax, dword ptr [ebp + 8]

        $sequence_3 = { 740e 56 57 68e7070000 }
            // n = 4, score = 200
            //   740e                 | je                  0x10
            //   56                   | push                esi
            //   57                   | push                edi
            //   68e7070000           | push                0x7e7

        $sequence_4 = { 6a02 a3???????? ff15???????? a3???????? }
            // n = 4, score = 200
            //   6a02                 | push                2
            //   a3????????           |                     
            //   ff15????????         |                     
            //   a3????????           |                     

        $sequence_5 = { ff05???????? 8b0d???????? 56 57 6a00 51 }
            // n = 6, score = 200
            //   ff05????????         |                     
            //   8b0d????????         |                     
            //   56                   | push                esi
            //   57                   | push                edi
            //   6a00                 | push                0
            //   51                   | push                ecx

        $sequence_6 = { 75e5 56 8b7510 57 8b7d0c }
            // n = 5, score = 200
            //   75e5                 | jne                 0xffffffe7
            //   56                   | push                esi
            //   8b7510               | mov                 esi, dword ptr [ebp + 0x10]
            //   57                   | push                edi
            //   8b7d0c               | mov                 edi, dword ptr [ebp + 0xc]

        $sequence_7 = { 50 ff15???????? 5d c20c00 75e5 56 }
            // n = 6, score = 200
            //   50                   | push                eax
            //   ff15????????         |                     
            //   5d                   | pop                 ebp
            //   c20c00               | ret                 0xc
            //   75e5                 | jne                 0xffffffe7
            //   56                   | push                esi

        $sequence_8 = { 68e7070000 50 ff15???????? ff05???????? }
            // n = 4, score = 200
            //   68e7070000           | push                0x7e7
            //   50                   | push                eax
            //   ff15????????         |                     
            //   ff05????????         |                     

        $sequence_9 = { 741d a1???????? 85c0 740e 56 57 }
            // n = 6, score = 200
            //   741d                 | je                  0x1f
            //   a1????????           |                     
            //   85c0                 | test                eax, eax
            //   740e                 | je                  0x10
            //   56                   | push                esi
            //   57                   | push                edi

    condition:
        7 of them and filesize < 499712
}