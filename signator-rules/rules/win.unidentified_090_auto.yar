rule win_unidentified_090_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.unidentified_090."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.unidentified_090"
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
        $sequence_0 = { 85c0 0f8480000000 6a00 8d4dc8 bfffff0080 51 }
            // n = 6, score = 100
            //   85c0                 | test                eax, eax
            //   0f8480000000         | je                  0x86
            //   6a00                 | push                0
            //   8d4dc8               | lea                 ecx, [ebp - 0x38]
            //   bfffff0080           | mov                 edi, 0x8000ffff
            //   51                   | push                ecx

        $sequence_1 = { e8???????? 83c408 8bbd58f7ffff 8d8710010000 50 68???????? 8d85b0f7ffff }
            // n = 7, score = 100
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8bbd58f7ffff         | mov                 edi, dword ptr [ebp - 0x8a8]
            //   8d8710010000         | lea                 eax, [edi + 0x110]
            //   50                   | push                eax
            //   68????????           |                     
            //   8d85b0f7ffff         | lea                 eax, [ebp - 0x850]

        $sequence_2 = { 5d c21000 8b45b0 ff30 ff15???????? 8b4dfc 33c0 }
            // n = 7, score = 100
            //   5d                   | pop                 ebp
            //   c21000               | ret                 0x10
            //   8b45b0               | mov                 eax, dword ptr [ebp - 0x50]
            //   ff30                 | push                dword ptr [eax]
            //   ff15????????         |                     
            //   8b4dfc               | mov                 ecx, dword ptr [ebp - 4]
            //   33c0                 | xor                 eax, eax

        $sequence_3 = { 8b4dd8 8d145502000000 8bc1 81fa00100000 7234 8b49fc 83c223 }
            // n = 7, score = 100
            //   8b4dd8               | mov                 ecx, dword ptr [ebp - 0x28]
            //   8d145502000000       | lea                 edx, [edx*2 + 2]
            //   8bc1                 | mov                 eax, ecx
            //   81fa00100000         | cmp                 edx, 0x1000
            //   7234                 | jb                  0x36
            //   8b49fc               | mov                 ecx, dword ptr [ecx - 4]
            //   83c223               | add                 edx, 0x23

        $sequence_4 = { c7470400000000 c7470800000000 c745fc00000000 33c0 c7471c00000000 c7472007000000 }
            // n = 6, score = 100
            //   c7470400000000       | mov                 dword ptr [edi + 4], 0
            //   c7470800000000       | mov                 dword ptr [edi + 8], 0
            //   c745fc00000000       | mov                 dword ptr [ebp - 4], 0
            //   33c0                 | xor                 eax, eax
            //   c7471c00000000       | mov                 dword ptr [edi + 0x1c], 0
            //   c7472007000000       | mov                 dword ptr [edi + 0x20], 7

        $sequence_5 = { 52 51 e8???????? 83c408 8b55cc 33c0 c745e000000000 }
            // n = 7, score = 100
            //   52                   | push                edx
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c408               | add                 esp, 8
            //   8b55cc               | mov                 edx, dword ptr [ebp - 0x34]
            //   33c0                 | xor                 eax, eax
            //   c745e000000000       | mov                 dword ptr [ebp - 0x20], 0

        $sequence_6 = { ff15???????? 8945fc 85c0 0f84f6000000 8b0f 8bd0 83f904 }
            // n = 7, score = 100
            //   ff15????????         |                     
            //   8945fc               | mov                 dword ptr [ebp - 4], eax
            //   85c0                 | test                eax, eax
            //   0f84f6000000         | je                  0xfc
            //   8b0f                 | mov                 ecx, dword ptr [edi]
            //   8bd0                 | mov                 edx, eax
            //   83f904               | cmp                 ecx, 4

        $sequence_7 = { 77c6 ff24851bff0010 8bce e8???????? eb45 834e28ff 895e24 }
            // n = 7, score = 100
            //   77c6                 | ja                  0xffffffc8
            //   ff24851bff0010       | jmp                 dword ptr [eax*4 + 0x1000ff1b]
            //   8bce                 | mov                 ecx, esi
            //   e8????????           |                     
            //   eb45                 | jmp                 0x47
            //   834e28ff             | or                  dword ptr [esi + 0x28], 0xffffffff
            //   895e24               | mov                 dword ptr [esi + 0x24], ebx

        $sequence_8 = { 7516 8b853cffffff 6a00 57 57 6a01 6a66 }
            // n = 7, score = 100
            //   7516                 | jne                 0x18
            //   8b853cffffff         | mov                 eax, dword ptr [ebp - 0xc4]
            //   6a00                 | push                0
            //   57                   | push                edi
            //   57                   | push                edi
            //   6a01                 | push                1
            //   6a66                 | push                0x66

        $sequence_9 = { 6808020000 6a00 57 e8???????? 83c40c 6808020000 6a40 }
            // n = 7, score = 100
            //   6808020000           | push                0x208
            //   6a00                 | push                0
            //   57                   | push                edi
            //   e8????????           |                     
            //   83c40c               | add                 esp, 0xc
            //   6808020000           | push                0x208
            //   6a40                 | push                0x40

    condition:
        7 of them and filesize < 750592
}