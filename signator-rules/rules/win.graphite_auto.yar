rule win_graphite_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.graphite."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.graphite"
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
        $sequence_0 = { 8bf0 56 ff15???????? 03c0 50 56 57 }
            // n = 7, score = 100
            //   8bf0                 | mov                 esi, eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   03c0                 | add                 eax, eax
            //   50                   | push                eax
            //   56                   | push                esi
            //   57                   | push                edi

        $sequence_1 = { ff742414 e8???????? 59 8bc5 5e 5d 5b }
            // n = 7, score = 100
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   8bc5                 | mov                 eax, ebp
            //   5e                   | pop                 esi
            //   5d                   | pop                 ebp
            //   5b                   | pop                 ebx

        $sequence_2 = { 7407 880e e9???????? 8d442410 }
            // n = 4, score = 100
            //   7407                 | je                  9
            //   880e                 | mov                 byte ptr [esi], cl
            //   e9????????           |                     
            //   8d442410             | lea                 eax, [esp + 0x10]

        $sequence_3 = { 8d4df0 e8???????? 688f000000 6a0b 5a 8d4df4 a3???????? }
            // n = 7, score = 100
            //   8d4df0               | lea                 ecx, [ebp - 0x10]
            //   e8????????           |                     
            //   688f000000           | push                0x8f
            //   6a0b                 | push                0xb
            //   5a                   | pop                 edx
            //   8d4df4               | lea                 ecx, [ebp - 0xc]
            //   a3????????           |                     

        $sequence_4 = { 83c40c 56 ff542410 ebd9 56 8b742408 6a04 }
            // n = 7, score = 100
            //   83c40c               | add                 esp, 0xc
            //   56                   | push                esi
            //   ff542410             | call                dword ptr [esp + 0x10]
            //   ebd9                 | jmp                 0xffffffdb
            //   56                   | push                esi
            //   8b742408             | mov                 esi, dword ptr [esp + 8]
            //   6a04                 | push                4

        $sequence_5 = { 8945fc 8b4510 48 894510 ebe2 c9 }
            // n = 6, score = 100
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   8b4510               | mov                 eax, dword ptr [ebp + 0x10]
            //   48                   | dec                 eax
            //   894510               | mov                 dword ptr [ebp + 0x10], eax
            //   ebe2                 | jmp                 0xffffffe4
            //   c9                   | leave               

        $sequence_6 = { ff15???????? ff35???????? ff15???????? 85c0 750c ff35???????? }
            // n = 6, score = 100
            //   ff15????????         |                     
            //   ff35????????         |                     
            //   ff15????????         |                     
            //   85c0                 | test                eax, eax
            //   750c                 | jne                 0xe
            //   ff35????????         |                     

        $sequence_7 = { 8d7c2424 59 a5 a5 a5 }
            // n = 5, score = 100
            //   8d7c2424             | lea                 edi, [esp + 0x24]
            //   59                   | pop                 ecx
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]
            //   a5                   | movsd               dword ptr es:[edi], dword ptr [esi]

        $sequence_8 = { c645fe17 e8???????? 68aa000000 6a26 5a }
            // n = 5, score = 100
            //   c645fe17             | mov                 byte ptr [ebp - 2], 0x17
            //   e8????????           |                     
            //   68aa000000           | push                0xaa
            //   6a26                 | push                0x26
            //   5a                   | pop                 edx

        $sequence_9 = { e8???????? 83c40c eb02 33f6 6a00 ff742414 ffd5 }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   eb02                 | jmp                 4
            //   33f6                 | xor                 esi, esi
            //   6a00                 | push                0
            //   ff742414             | push                dword ptr [esp + 0x14]
            //   ffd5                 | call                ebp

    condition:
        7 of them and filesize < 75776
}