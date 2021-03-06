rule win_newposthings_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.newposthings."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.newposthings"
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
        $sequence_0 = { 6a10 68c8d30110 e8???????? 33ff }
            // n = 4, score = 100
            //   6a10                 | push                0x10
            //   68c8d30110           | push                0x1001d3c8
            //   e8????????           |                     
            //   33ff                 | xor                 edi, edi

        $sequence_1 = { 53 66a3???????? ff15???????? befb020000 85c0 751b 68108d0110 }
            // n = 7, score = 100
            //   53                   | push                ebx
            //   66a3????????         |                     
            //   ff15????????         |                     
            //   befb020000           | mov                 esi, 0x2fb
            //   85c0                 | test                eax, eax
            //   751b                 | jne                 0x1d
            //   68108d0110           | push                0x10018d10

        $sequence_2 = { c78538feffff0f000000 c78534feffff00000000 c68524feffff00 e8???????? 8b35???????? 83c40c c78558feffffc8000000 }
            // n = 7, score = 100
            //   c78538feffff0f000000     | mov    dword ptr [ebp - 0x1c8], 0xf
            //   c78534feffff00000000     | mov    dword ptr [ebp - 0x1cc], 0
            //   c68524feffff00       | mov                 byte ptr [ebp - 0x1dc], 0
            //   e8????????           |                     
            //   8b35????????         |                     
            //   83c40c               | add                 esp, 0xc
            //   c78558feffffc8000000     | mov    dword ptr [ebp - 0x1a8], 0xc8

        $sequence_3 = { 6a00 50 ffb574ffffff 51 ff15???????? 8bc8 890b }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   50                   | push                eax
            //   ffb574ffffff         | push                dword ptr [ebp - 0x8c]
            //   51                   | push                ecx
            //   ff15????????         |                     
            //   8bc8                 | mov                 ecx, eax
            //   890b                 | mov                 dword ptr [ebx], ecx

        $sequence_4 = { c645fc0d 83bd7cffffff10 720e ffb568ffffff }
            // n = 4, score = 100
            //   c645fc0d             | mov                 byte ptr [ebp - 4], 0xd
            //   83bd7cffffff10       | cmp                 dword ptr [ebp - 0x84], 0x10
            //   720e                 | jb                  0x10
            //   ffb568ffffff         | push                dword ptr [ebp - 0x98]

        $sequence_5 = { 6894c60110 ffb53cfeffff ffd7 85c0 0f85b9000000 898534feffff 898538feffff }
            // n = 7, score = 100
            //   6894c60110           | push                0x1001c694
            //   ffb53cfeffff         | push                dword ptr [ebp - 0x1c4]
            //   ffd7                 | call                edi
            //   85c0                 | test                eax, eax
            //   0f85b9000000         | jne                 0xbf
            //   898534feffff         | mov                 dword ptr [ebp - 0x1cc], eax
            //   898538feffff         | mov                 dword ptr [ebp - 0x1c8], eax

        $sequence_6 = { 6a00 b947000000 be???????? f3a5 6a02 6a00 6a00 }
            // n = 7, score = 100
            //   6a00                 | push                0
            //   b947000000           | mov                 ecx, 0x47
            //   be????????           |                     
            //   f3a5                 | rep movsd           dword ptr es:[edi], dword ptr [esi]
            //   6a02                 | push                2
            //   6a00                 | push                0
            //   6a00                 | push                0

        $sequence_7 = { 8b3d???????? 8b1d???????? 8bff 68c0270900 ffd6 833d????????00 74f0 }
            // n = 7, score = 100
            //   8b3d????????         |                     
            //   8b1d????????         |                     
            //   8bff                 | mov                 edi, edi
            //   68c0270900           | push                0x927c0
            //   ffd6                 | call                esi
            //   833d????????00       |                     
            //   74f0                 | je                  0xfffffff2

        $sequence_8 = { 64a300000000 8bf1 8975f0 c745fcffffffff f6450801 c706947f0110 7409 }
            // n = 7, score = 100
            //   64a300000000         | mov                 dword ptr fs:[0], eax
            //   8bf1                 | mov                 esi, ecx
            //   8975f0               | mov                 dword ptr [ebp - 0x10], esi
            //   c745fcffffffff       | mov                 dword ptr [ebp - 4], 0xffffffff
            //   f6450801             | test                byte ptr [ebp + 8], 1
            //   c706947f0110         | mov                 dword ptr [esi], 0x10017f94
            //   7409                 | je                  0xb

        $sequence_9 = { 8934fd58654100 eb07 56 e8???????? 59 c745fcfeffffff e8???????? }
            // n = 7, score = 100
            //   8934fd58654100       | mov                 dword ptr [edi*8 + 0x416558], esi
            //   eb07                 | jmp                 9
            //   56                   | push                esi
            //   e8????????           |                     
            //   59                   | pop                 ecx
            //   c745fcfeffffff       | mov                 dword ptr [ebp - 4], 0xfffffffe
            //   e8????????           |                     

    condition:
        7 of them and filesize < 827392
}